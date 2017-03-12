module.exports = function (casper, ready) {
    casper.wait(2000, function() {
        casper.click('.galleria-thumbnails div:first-of-type');
        ready();
    });
}