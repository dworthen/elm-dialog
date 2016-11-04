var _dworthen$elm_dialog$Native_Dialog = function () {

    var unit = {ctor: '_Tuple0'};
    var nativeBinding = _elm_lang$core$Native_Scheduler.nativeBinding;
    var succeed = _elm_lang$core$Native_Scheduler.succeed;
    var fail = _elm_lang$core$Native_Scheduler.fail;
    var Nothing = _elm_lang$core$Maybe$Nothing;
    var Just = _elm_lang$core$Maybe$Just;

    function confirm(message) {
        return nativeBinding(function(callback) {
            var openTime = new Date();
            var results = window.confirm(message);
            var closeTime = new Date();

            if(closeTime - openTime < 100) {
                return callback(fail({ctor: 'Disabled'}));
            } else {
                return callback(succeed(!!results));
            }
        });
    }

    function alert(message) {
        return nativeBinding(function(callback) {
            var openTime = new Date();
            var result = window.alert(message);
            var closeTime = new Date();

            if(closeTime - openTime < 100) {
                return callback(fail({ctor: 'Disabled'}));
            } else {
                return callback(succeed(unit));
            }
        });
    }

    function prompt(message) {
        return nativeBinding(function(callback) {
            var openTime = new Date();
            var results = window.prompt(message);
            var closeTime = new Date();

            if(closeTime - openTime < 100) {
                return callback(fail({ctor: 'Disabled'}));
            } else {
                if(results === null || results === "") {
                    return callback(succeed(Nothing));
                } else {
                    return callback(succeed(Just(results)));
                } 
            }
        });
    }

    return {
        'confirm': confirm,
        'alert': alert,
        'prompt': prompt
    }

} ();