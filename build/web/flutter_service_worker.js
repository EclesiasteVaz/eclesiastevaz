'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"main.dart.js": "a85658edbe1b480d5a80d7e8537f389a",
"manifest.json": "955af06ed58ef9f96cf7b2da4702c134",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"index.html": "cc5d0bead3727623b7569c9cebd36df5",
"/": "cc5d0bead3727623b7569c9cebd36df5",
"flutter_bootstrap.js": "08504032ae484b97f8341e0645a7c8f6",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "8ce77a48ba9c41e360851d457673e49c",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"assets/NOTICES": "bc9c962baac632dbcb6960309bee1feb",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "dea783f1cba6baf3a86e38423fdf2f38",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/AssetManifest.bin.json": "3ce77a35d1dcb672b23ddca7e1b87a1b",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.json": "8bdb3c3d6e3ae03c78376ba8e7b13f00",
"assets/AssetManifest.bin": "5abb1ca7866df05615cffdb508e1acd1",
"assets/assets/images/projects/kitipo.png": "0c9c228d811b1c9230c5b94097d75d6c",
"assets/assets/images/projects/lista-de-tarefas.png": "9cc4a088f658a0134bd7f4effd5d1da3",
"assets/assets/images/projects/super-teclas.png": "7ee7f0579b8580dbbd9437963bd13d7c",
"assets/assets/images/projects/tradao.png": "3080208219dd9cd2045a5f95faf6e6e1",
"assets/assets/images/IMG-20250124-WA0020.jpg": "80f22828a0c5c0f6720bca9b0b08c21e",
"assets/assets/images/IMG-20241026-WA0091.jpg": "680032cd77de2849b9238235c691d705",
"assets/assets/images/tools/android-studio-icon-1940x2048-pk1n6dh8.png": "95cf6efa831aacffd49c917755321e90",
"assets/assets/images/tools/MySQL.png": "b86955c0c2c5136cd455a9708c975773",
"assets/assets/images/tools/Postman.png": "5972522c58523d1ac196ae2edc797d68",
"assets/assets/images/tools/lunacy.png": "ad3a5382a4d6cfd639963816921c7af5",
"assets/assets/images/tools/PHP.png": "f3d6e2b07c1ec7347c5d458ce59e5b3a",
"assets/assets/images/tools/MySQL-Logo.wine.png": "754e01e49836a295574661a188161775",
"assets/assets/images/tools/Flutter.png": "11d934b216851323c314f435701ff6d1",
"assets/assets/images/tools/icone-de-flutter.png": "6faf77d1968914e6ea062c908c286335",
"assets/assets/images/tools/Laravel.png": "5e0fc7536445ccea79c2fb84c7edaa4a",
"assets/assets/images/tools/5968332.png": "94242182bd0c201484a8e9d8e8f55d25",
"assets/assets/images/tools/Dart.png": "3d4712fbcc4ccae798a6a212e78d686a",
"assets/assets/images/tools/Black%2520and%2520White%2520Modern%2520Professional%2520Sales%2520and%2520Marketing%2520Profile%2520LinkedIn%2520Banner%2520(1).png": "ed8105d3bd459a63c8cea54df7db1808",
"assets/assets/images/tools/Black%2520and%2520White%2520Modern%2520Professional%2520Sales%2520and%2520Marketing%2520Profile%2520LinkedIn%2520Banner.png": "b0fa4d7048a6832c65c09aa354f88980"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
