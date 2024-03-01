// const string AltConditionPattern = "75 1D 48 8B 83 88 00 00 00 48 85 C0 74 09 83 B8 94 0A 00 00 00 75 08 33 C0 48 83 C4 20 5B C3 B8 01 00 00 00 48 83 C4 20 5B C3";
// const string AltConditionPattern = "75 1D 48 8B 83 88 00 00 00 48 85 C0 74 09";
// pattern is unique provided we include up to 88  vv
const string AltConditionPattern = "75 1D 48 8B 83 88 00 00 00";

MemPatcher@ PatchAltCheck = MemPatcher(
    AltConditionPattern, {0}, {"90 90"} // nop jne that is active when alt is held
);

bool IsPatchEnabled {
    get {
        return PatchAltCheck.IsApplied;
    }
    set {
        PatchAltCheck.IsApplied = value;
    }
}
