'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/android/android-launchericon-96-96.png": "a2212bc50ccbe6748509f1d0f3d4875b",
"icons/android/android-launchericon-48-48.png": "5f45fed1a40e68cf7574c4d1ad9eae47",
"icons/android/android-launchericon-192-192.png": "5c509051df863ef8d2756c6e9b7bbe8c",
"icons/android/android-launchericon-144-144.png": "a9056fecf23750c45987af2e328c23ec",
"icons/android/android-launchericon-512-512.png": "56210adb9cd94472cb36a9866890b38d",
"icons/android/android-launchericon-72-72.png": "314327b8e313f851c05762d48ec6f613",
"icons/ios/64.png": "32daf2431a39077940445f47837a489a",
"icons/ios/72.png": "314327b8e313f851c05762d48ec6f613",
"icons/ios/87.png": "35b2be9f73da9066538121c55f8da932",
"icons/ios/50.png": "839d586a40a557204d6ec6d597247fbe",
"icons/ios/80.png": "d43d5a5c8924c5f4541033e2da314668",
"icons/ios/192.png": "5c509051df863ef8d2756c6e9b7bbe8c",
"icons/ios/32.png": "acc0a955eb03c6e9a248579e476d3fcf",
"icons/ios/76.png": "a3c22b8dc02c78ef85ccd64da8878e2d",
"icons/ios/1024.png": "3094c5fca322fd3b4fbb212d52e24a2c",
"icons/ios/20.png": "ac03e56e43ec2bcedb4f6f7957d0830c",
"icons/ios/152.png": "3d6e1720b9f944c4fe2486cda908fa9a",
"icons/ios/180.png": "63888220d84af24fbc04c6a5515aa46b",
"icons/ios/60.png": "2756a1db9f12bd0e7cd39d6a202cbc89",
"icons/ios/120.png": "43f61d656b3bf4d9db11fd7bfa9178a4",
"icons/ios/40.png": "4dbe3ac7cc4be96aed1899e3032bba1c",
"icons/ios/144.png": "a9056fecf23750c45987af2e328c23ec",
"icons/ios/16.png": "38227088b4186386ddf88c99690bcd48",
"icons/ios/128.png": "281cf642a3e7e4e9742a033af4251b4d",
"icons/ios/100.png": "87cefd55ea0e1ce8d34e818ad6161828",
"icons/ios/114.png": "3e58346fc0c72856dff750896bc50350",
"icons/ios/512.png": "56210adb9cd94472cb36a9866890b38d",
"icons/ios/57.png": "08e99dd3595297f907187ae665d6f38e",
"icons/ios/58.png": "802ee22df4c10f61b796d154c1f6cdac",
"icons/ios/167.png": "edf27c65d238dcf7516e141d0750eefe",
"icons/ios/256.png": "10a4ac8235946f6daff9e85900ea254d",
"icons/ios/29.png": "b62d10bc058911241c9b54ff29484a00",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-36.png": "56d94786b6d657af814ca385ed548cff",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-24.png": "6726a550dbe0e79e21fc3699024febc0",
"icons/windows11/StoreLogo.scale-100.png": "839d586a40a557204d6ec6d597247fbe",
"icons/windows11/StoreLogo.scale-400.png": "e14dc84e1fadcc4d5bd9d0c19028d965",
"icons/windows11/SplashScreen.scale-100.png": "b905e3e7af0ce69d8a240c8b2a871cb3",
"icons/windows11/SplashScreen.scale-400.png": "ed9b2746dcf8aad1165c93f32e9ae1aa",
"icons/windows11/SmallTile.scale-400.png": "c2eb4d2ea260f17fdc099e6b39ff27ef",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-44.png": "a47808e177da09037b71db61f79e8a91",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-32.png": "0da6c68ceda858a2435ad265955e6945",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-60.png": "a3e5cbb2e2442b66a72187cb6f40cad0",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-256.png": "d4a2c883e33021721e50a21d2b71d4fd",
"icons/windows11/Square44x44Logo.targetsize-44.png": "a47808e177da09037b71db61f79e8a91",
"icons/windows11/Square44x44Logo.scale-125.png": "7b6c0c65cbe0d9cbba8c8ea1dd49a9ff",
"icons/windows11/Square44x44Logo.scale-150.png": "2ac36d70c53a9eca00890b70e6896d97",
"icons/windows11/SmallTile.scale-150.png": "d7a4a2a6323605f89c87b4c4c0db2f52",
"icons/windows11/Wide310x150Logo.scale-125.png": "c9f6cc93ee3d56e533e525ca01307592",
"icons/windows11/Square150x150Logo.scale-400.png": "0923011d3317a2552d0868685a503262",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-96.png": "10273c6a9d007f03f29e39b98e1d1330",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-40.png": "cdb9785adc8b767047fc89f564205697",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-48.png": "7d7d06b8865e5aa36d873e2372d07517",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-64.png": "30147a9ff15887467411074db9327ad8",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-32.png": "0da6c68ceda858a2435ad265955e6945",
"icons/windows11/SmallTile.scale-125.png": "322de1f8d21ccadbf80694dd83fda10d",
"icons/windows11/Square44x44Logo.scale-100.png": "a47808e177da09037b71db61f79e8a91",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-30.png": "c1733d375263843e5d67bf284017817f",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-16.png": "5a7e8a9c180ad1188d7b34234b756afc",
"icons/windows11/Square44x44Logo.targetsize-36.png": "56d94786b6d657af814ca385ed548cff",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-60.png": "a3e5cbb2e2442b66a72187cb6f40cad0",
"icons/windows11/Square44x44Logo.scale-200.png": "764630a05cac017462681589b57e4e04",
"icons/windows11/Square150x150Logo.scale-150.png": "0e8f0d1c41955852d5495a3f2a177355",
"icons/windows11/Square44x44Logo.scale-400.png": "f928b303f2b6366bf02e003ad52b36ae",
"icons/windows11/Square44x44Logo.targetsize-40.png": "cdb9785adc8b767047fc89f564205697",
"icons/windows11/Wide310x150Logo.scale-150.png": "e56303b4e1760ffa1596b577e01ed53c",
"icons/windows11/Square44x44Logo.targetsize-24.png": "6726a550dbe0e79e21fc3699024febc0",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-80.png": "4aa7f2b8113c215bffbc27bb06dc8939",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-36.png": "56d94786b6d657af814ca385ed548cff",
"icons/windows11/Wide310x150Logo.scale-100.png": "56d637df4e51bbc5753e416665f43296",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-24.png": "6726a550dbe0e79e21fc3699024febc0",
"icons/windows11/SplashScreen.scale-150.png": "47494b88bbb80f1bf024d6a32f4d35cd",
"icons/windows11/SmallTile.scale-100.png": "a33f8aeeb11edaeffbdffdb97539aa91",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-80.png": "4aa7f2b8113c215bffbc27bb06dc8939",
"icons/windows11/SmallTile.scale-200.png": "482d124732327b2def53a37af1aa1619",
"icons/windows11/Wide310x150Logo.scale-200.png": "b905e3e7af0ce69d8a240c8b2a871cb3",
"icons/windows11/Square44x44Logo.targetsize-96.png": "10273c6a9d007f03f29e39b98e1d1330",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-48.png": "7d7d06b8865e5aa36d873e2372d07517",
"icons/windows11/Square44x44Logo.targetsize-16.png": "5a7e8a9c180ad1188d7b34234b756afc",
"icons/windows11/LargeTile.scale-400.png": "72b449a7412be6d3840f996a1a87b6dc",
"icons/windows11/StoreLogo.scale-200.png": "87cefd55ea0e1ce8d34e818ad6161828",
"icons/windows11/Square44x44Logo.targetsize-20.png": "e595bb8235de6ab460f89eed8afce8ef",
"icons/windows11/StoreLogo.scale-150.png": "edf570eac5b7500a56daf6df33fac1f9",
"icons/windows11/Square150x150Logo.scale-100.png": "bcb589871ac6840b4cc0d93631c9781d",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-64.png": "30147a9ff15887467411074db9327ad8",
"icons/windows11/Wide310x150Logo.scale-400.png": "871441a7dbfe4e90495b07d23d10fc79",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-20.png": "e595bb8235de6ab460f89eed8afce8ef",
"icons/windows11/Square44x44Logo.targetsize-60.png": "a3e5cbb2e2442b66a72187cb6f40cad0",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-256.png": "d4a2c883e33021721e50a21d2b71d4fd",
"icons/windows11/Square44x44Logo.targetsize-32.png": "0da6c68ceda858a2435ad265955e6945",
"icons/windows11/Square44x44Logo.targetsize-48.png": "7d7d06b8865e5aa36d873e2372d07517",
"icons/windows11/LargeTile.scale-100.png": "1ad14bf2df1299fda20b8608402a892c",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-16.png": "5a7e8a9c180ad1188d7b34234b756afc",
"icons/windows11/Square44x44Logo.targetsize-256.png": "d4a2c883e33021721e50a21d2b71d4fd",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-40.png": "cdb9785adc8b767047fc89f564205697",
"icons/windows11/SplashScreen.scale-125.png": "547cddba3e4e5820affa269b764674bf",
"icons/windows11/StoreLogo.scale-125.png": "71f141cc53851d76d47bf369aa668860",
"icons/windows11/LargeTile.scale-125.png": "3a887917bb8ea7483df0654053ae6a80",
"icons/windows11/Square44x44Logo.targetsize-64.png": "30147a9ff15887467411074db9327ad8",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-96.png": "10273c6a9d007f03f29e39b98e1d1330",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-72.png": "b4ef8883e5902ca52597295d60c8a13f",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-72.png": "b4ef8883e5902ca52597295d60c8a13f",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-20.png": "e595bb8235de6ab460f89eed8afce8ef",
"icons/windows11/Square150x150Logo.scale-125.png": "f588fed9776ff200cf59da8fa1197ad4",
"icons/windows11/SplashScreen.scale-200.png": "871441a7dbfe4e90495b07d23d10fc79",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-44.png": "a47808e177da09037b71db61f79e8a91",
"icons/windows11/Square150x150Logo.scale-200.png": "e6fec22cca9797b834dcd1b28944b57c",
"icons/windows11/Square44x44Logo.targetsize-72.png": "b4ef8883e5902ca52597295d60c8a13f",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-30.png": "c1733d375263843e5d67bf284017817f",
"icons/windows11/Square44x44Logo.targetsize-80.png": "4aa7f2b8113c215bffbc27bb06dc8939",
"icons/windows11/Square44x44Logo.targetsize-30.png": "c1733d375263843e5d67bf284017817f",
"icons/windows11/LargeTile.scale-150.png": "cb682e1c1ed4d4610ae5d70e14bc2d05",
"icons/windows11/LargeTile.scale-200.png": "aba73100901cd48146ed4a25e4fc54ee",
"version.json": "ae58cedaa7ce6194839a22b64dde95e6",
"makhosi.png": "cbe419fd41aa909b13d399f143edcb3f",
"manifest.json": "0cfb06f0160fe59c5db9672303f91ecf",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"index.html": "22fc760af2fc88f92a88bb96151d4aaa",
"/": "22fc760af2fc88f92a88bb96151d4aaa",
"favicon.ico": "f09489687edbedca15b0e8dcfd2c2aac",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"main.dart.js": "ab506aeeb3dfa6cb284f1f3302a9e0b6",
"CNAME": "70644477fb345f9c6f1672ef2618972c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "a5d7457fda15b7622c14f432ba63039a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "7b2be9d5861c79c08892ac0ec797563b",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "b72c617acdf2227c8b1413215f620711",
"assets/AssetManifest.bin": "0e92297f4d3395f888a38272a7c6fd73",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.json": "670a4467ce205e0286eaa2d1a67f7787",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "c8dde5aa413b0b02354c7aaba495cb8d",
"assets/AssetManifest.bin.json": "bbe08c9aef1cc50dec625536c0a2b1dc",
"assets/NOTICES": "f9b2427d7e858e4deb4cf2eb6b44421b",
"assets/assets/canonical_agency.jpg": "6694fd7645a4ab230e549905aeb33c3b",
"assets/assets/verified_2.jpg": "e8eb5295f0e4dbaefd435b6c17b3a4cc",
"assets/assets/verified.jpg": "9526121479c64735ef3b6d5989775e18",
"assets/assets/logo.png": "2cae63614c1d676d50e4e06fed3bf63e",
"assets/assets/work_1.jpg": "4849b116df4e22cf0b6c4220ddb8d794",
"assets/assets/taura-ai.jpg": "050d58b3b725b1f03a62af2faf8faa2a",
"assets/assets/nguni.jpg": "26cb741119ab2eebaa8f0593567a04f6",
"assets/assets/muse_api.jpg": "7f474bd6451051a50febc3fbffb0390d",
"assets/assets/rsa_id_number.jpg": "a722e66092dd65d80d24dfe573c95b1a",
"assets/assets/project_image.jpg": "f168a175bf5f27b6795e8a5518d54d24",
"assets/assets/dictionary-react-app.jpg": "c90073bc1d2183499aae89c179af8569",
"assets/assets/menu.png": "4dc879fc02ce9a3df3f8b952507144ba",
"assets/assets/hero-image.gif": "94f06da13e2db8897ae3c746d60b515d",
"assets/assets/hero-image.jpg": "8925409f88f52890fe8dead88ba99939",
"assets/assets/hero-view.png": "a48147509bde0ed12c93e1bfd7d21fb2",
"assets/assets/muse.jpg": "527081427c937f4bcb56968bcc22fef1",
"404.html": "1dab32d391e585819e9a390e00fb86f5"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
