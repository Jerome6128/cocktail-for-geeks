// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// app/javascript/packs/application.js
import 'bootstrap';

import { initSelect2 } from '../components/init_select2';
import { loadDynamicBannerText } from '../components/banner';
import { initSweetalert } from '../components/init_sweetalert';

document.addEventListener("turbolinks:load", function() {
  initSelect2();
  loadDynamicBannerText();
  initSweetalert('.destroy_dose', {
  title: "A nice alert",
  text: "This is a great alert, isn't it?",
  icon: "success"
});
});


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
