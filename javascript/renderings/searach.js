module.exports = function (casper, ready) {
    casper.waitWhileSelector('.no-results', function () {
        ready();
    });
}