// JobPack: starts the BusyTeX engine unchanged, but serves its core bundle (texlive-basic.data, over GitHub's
// 100 MB file limit) from parts published beside it: both fetch() and XMLHttpRequest requests for that one file
// are answered with the parts joined. Everything else passes straight through.
const BIG = 'texlive-basic.data';
let joined = null;
function assemble(url) {
  joined ??= (async () => {
    const m = await (await fetch(url.replace(/texlive-basic\.data(\?.*)?$/, 'parts.json'))).json();
    const bufs = await Promise.all(Array.from({ length: m.parts }, (_, i) => fetch(`${url.replace(/\?.*$/, '')}.part${i}`).then((r) => { if (!r.ok) throw new Error(`part ${i}: ${r.status}`); return r.arrayBuffer(); })));
    const all = new Uint8Array(m.size); let at = 0;
    for (const b of bufs) { all.set(new Uint8Array(b), at); at += b.byteLength; }
    if (at !== m.size) throw new Error('The LaTeX core bundle is incomplete.');
    return all.buffer;
  })();
  return joined;
}
const realFetch = self.fetch.bind(self);
self.fetch = (input, init) => {
  const url = typeof input === 'string' ? input : input.url;
  if (String(url).split('?')[0].endsWith(BIG)) return assemble(new URL(url, self.location.href).href).then((b) => new Response(b, { status: 200 }));
  return realFetch(input, init);
};
const RealXHR = self.XMLHttpRequest;
self.XMLHttpRequest = class extends RealXHR {
  open(method, url, ...rest) { this._jpUrl = new URL(String(url), self.location.href).href; return super.open(method, url, ...rest); }
  send(body) {
    if (!this._jpUrl || !this._jpUrl.split('?')[0].endsWith(BIG)) return super.send(body);
    assemble(this._jpUrl).then((buf) => {
      for (const [k, v] of Object.entries({ status: 200, readyState: 4, response: buf })) Object.defineProperty(this, k, { value: v, configurable: true });
      this.onprogress?.({ loaded: buf.byteLength, total: buf.byteLength, lengthComputable: true });
      this.onreadystatechange?.({}); this.onload?.({});
    }, (e) => { this.onerror?.(e); });
  }
};
importScripts('busytex_worker.js');
