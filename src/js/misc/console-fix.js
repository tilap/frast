'use strict';
/* global window */ 

// For browser that havent console...
module.exports = function() {
    if (!window.console) {
        window.console = {
            log: function() {},
            info: function() {},
            error: function() {}
        };
    }
};
