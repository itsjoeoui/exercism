use time::{ext::NumericalDuration, PrimitiveDateTime as DateTime};

// Returns a DateTime one billion seconds after start.
pub fn after(start: DateTime) -> DateTime {
    start + 1e9.seconds()
}
