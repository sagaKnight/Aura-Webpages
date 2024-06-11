export function getImageSrc(array, imageName, collectionName) {
    return new URL(`../assets/images/collections/${collectionName}page/${array[imageName]}`, import.meta.url).href;
  }
  