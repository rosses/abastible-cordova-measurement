var exec = require('cordova/exec');

exports.startMeasurement = function(weight, tarra, type, id, full, success, error) {
    exec(success, error, "Abastible", "startMeasurement", [weight, tarra, type, id, full]);
};

exports.startMeasurementMultiple = function(weight, tarra, type, id, full, nrOfMeasurements, success, error) {
    exec(success, error, "Abastible", "startMeasurementMultiple", [weight, tarra, type, id, full, nrOfMeasurements]);
};