// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)


if (XHR.status != 200) {
  alert(`Error ${XHR.status}: ${XHR.statusText}`);
  return null;
};