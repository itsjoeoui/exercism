#[derive(Debug)]
pub struct Duration(f64);

impl From<u64> for Duration {
    fn from(s: u64) -> Self {
        Duration(s as f64)
    }
}

pub trait Planet {
    const YEARS_IN_SECONDS: f64;
    fn years_during(d: &Duration) -> f64 {
        d.0 / Self::YEARS_IN_SECONDS
    }
}

macro_rules! set_planet {
    ($planet_name:ident, $earth_years_in_year:expr) => {
        pub struct $planet_name;
        impl Planet for $planet_name {
            const YEARS_IN_SECONDS: f64 = $earth_years_in_year * 31557600.0;
        }
    };
}

set_planet!(Earth, 1.0);
set_planet!(Mercury, 0.2408467);
set_planet!(Venus, 0.61519726);
set_planet!(Mars, 1.8808158);
set_planet!(Jupiter, 11.862615);
set_planet!(Saturn, 29.447498);
set_planet!(Uranus, 84.016846);
set_planet!(Neptune, 164.79132);
