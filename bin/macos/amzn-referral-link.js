// to shorten a valid Amazon link in the front most tab:
// $ osascript amzn-referral-link.js

var amznShortUrl = function (inputUrl) {
  var baseUrl = "http://www.amzn.com",
    trackingId = "drbu-20",
    productIdMatch = inputUrl.match(
      "(amazon|amzn).*?(/[a-zA-Z0-9]{10})(?:[/?]|$)"
    );

  return productIdMatch
    ? [baseUrl, productIdMatch[2], "?tag=", trackingId].join("")
    : inputUrl;
};

Application("Safari").documents[0].url();
Safari = Application("Safari");
frontmostLink = amznShortUrl(Safari.document.url()[0]);
