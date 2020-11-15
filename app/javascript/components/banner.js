import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["#awesome_beverages", "#for_developers_only", "#by_developers_only"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
