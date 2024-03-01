[Setting category="Patch" name="Activate patch on game start?"]
bool S_EnablePatchOnLoad = false;

void Main() {
    if (S_EnablePatchOnLoad) {
        IsPatchEnabled = true;
        Notify("Enabling ALT blocking patch.");
    }
}

void RenderMenu() {
    if (UI::MenuItem("Patch: Stop ALT blocking inputs", "", IsPatchEnabled)) {
        IsPatchEnabled = !IsPatchEnabled;
    }
}


shared void Notify(const string &in msg) {
    UI::ShowNotification(Meta::ExecutingPlugin().Name, msg);
    trace("Notified: " + msg);
}

shared void NotifySuccess(const string &in msg) {
    UI::ShowNotification(Meta::ExecutingPlugin().Name, msg, vec4(.4, .7, .1, .3), 10000);
    trace("Notified: " + msg);
}

shared void NotifyError(const string &in msg) {
    warn(msg);
    UI::ShowNotification(Meta::ExecutingPlugin().Name + ": Error", msg, vec4(.9, .3, .1, .3), 15000);
}

shared void NotifyWarning(const string &in msg) {
    warn(msg);
    UI::ShowNotification(Meta::ExecutingPlugin().Name + ": Warning", msg, vec4(.9, .6, .2, .3), 15000);
}
