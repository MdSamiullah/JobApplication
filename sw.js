/* JobPack service worker: makes the site installable and usable offline.
 * Built files are listed at build time (scripts/build-sw.mjs) and saved on first visit.
 * Pages: network first, then the saved copy. Built files: saved copy first (their names change with each version).
 * Server requests (/api, the Cloudflare Worker, AI services) are never saved. */
const VERSION = '319d2c236e3e';
const FILES = ["./","assets/__vite-browser-external-BIHI7g3E.js","assets/docxTemplate-BQcHqSqa.js","assets/freeTier-CH4Rux0x.js","assets/index-D1BZmrGC.css","assets/index-D5Zj-O2M.js","assets/pdf.worker.min-XYqMGZ9_.js","assets/pdf.worker.min-Z0yPf8Sv.mjs","assets/vendor-DgjsPrM2.js","assets/worker-BzDtYIsj.js","auth-redirect.html","icons/apple-touch-icon.png","icons/icon-192.png","icons/icon-512.png","icons/icon-maskable-512.png","manifest.webmanifest","index.html"];
const CACHE = `jobpack-${VERSION}`;

self.addEventListener('install', (e) => {
  e.waitUntil(caches.open(CACHE).then((c) => c.addAll(FILES.map((f) => new URL(f, self.registration.scope).href))));
});
self.addEventListener('activate', (e) => {
  e.waitUntil(caches.keys().then((keys) => Promise.all(keys.filter((k) => k.startsWith('jobpack-') && k !== CACHE).map((k) => caches.delete(k)))).then(() => self.clients.claim()));
});
// A new version waits until the person chooses "Reload", so nothing changes in the middle of their work.
self.addEventListener('message', (e) => { if (e.data === 'SKIP_WAITING') self.skipWaiting(); });

/** What to do with a request: 'skip' (let the browser handle it), 'page' or 'file'. Exposed for tests. */
function strategy(url, mode, scope) {
  if (!url.startsWith(scope)) return 'skip'; // other sites: Google Fonts, the Worker, AI services
  const path = url.slice(scope.length);
  if (path.startsWith('api/') || path.startsWith('cdn-cgi/') || path.includes('/api/')) return 'skip';
  return mode === 'navigate' ? 'page' : 'file';
}
self.__strategy = strategy;

self.addEventListener('fetch', (e) => {
  const req = e.request;
  if (req.method !== 'GET') return;
  const how = strategy(req.url, req.mode, self.registration.scope);
  if (how === 'skip') return;
  if (how === 'page') {
    e.respondWith(fetch(req).then((res) => {
      const copy = res.clone(); caches.open(CACHE).then((c) => c.put(new URL('index.html', self.registration.scope).href, copy)).catch(() => {});
      return res;
    }).catch(() => caches.match(new URL('index.html', self.registration.scope).href)));
    return;
  }
  e.respondWith(caches.match(req).then((hit) => hit || fetch(req).then((res) => {
    if (res.ok && res.type === 'basic') { const copy = res.clone(); caches.open(CACHE).then((c) => c.put(req, copy)).catch(() => {}); }
    return res;
  })));
});
