var _dworthen$elm_dialog$Native_Dialog = function () {

    function confirm(message) {
        // Async version
        // return _elm_lang$core$Native_Scheduler.nativeBinding(function(callback) {
        //     var results = window.confirm(prompt);
        //     return callback(_elm_lang$core$Native_Scheduler.succeed(results));
        // });

        // Sync version
        return window.confirm(message);
    }

    function alert(message) {
        window.alert(message);
        return true;
    }

    function prompt(message) {
        var results = window.prompt(message);
        if (!results || results === "") prompt(message);
        return results;
    }

    return {
        'confirm': confirm,
        'alert': alert,
        'prompt': prompt
    }

} ();