module.exports = function (casper, ready) {
    casper.waitWhileSelector('.no-results', function () {
        casper.wait(100, function () {
            ready();
        });
    });
}