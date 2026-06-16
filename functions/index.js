const { onCall } = require("firebase-functions/v2/https");
const { setGlobalOptions } = require("firebase-functions/v2");
const logger = require("firebase-functions/logger");

// Limit instances (cost + safety)
setGlobalOptions({ maxInstances: 10 });

exports.compareProducts = onCall(async (request) => {
  try {
    const query = request.data.query;

    if (!query) {
      return { products: [] };
    }

    logger.info("Searching for:", query);

    // 🔹 TEMP DUMMY DATA (replace later with real APIs)
    const products = [
      {
        title: "iPhone 14",
        price: 999,
        image:
          "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-14",
        platform: "Amazon",
      },
      {
        title: "iPhone 14 Pro",
        price: 1199,
        image:
          "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-14-pro",
        platform: "Daraz",
      },
    ];

    return { products };
  } catch (error) {
    logger.error("compareProducts error:", error);
    throw new Error("Failed to fetch products");
  }
});
