use rand::{thread_rng, Rng};

pub fn private_key(p: u64) -> u64 {
    thread_rng().gen_range(2..p)
}

pub fn public_key(p: u64, g: u64, a: u64) -> u64 {
    powmod(g, a, p)
}

pub fn secret(p: u64, b_pub: u64, a: u64) -> u64 {
    powmod(b_pub, a, p)
}

// exponentiation with a modulus and a positive exponent
fn powmod(x: u64, e: u64, m: u64) -> u64 {
    if e == 0 {
        1
    } else if e == 1 {
        x
    } else if e % 2 == 0 {
        powmod((x * x) % m, e / 2, m)
    } else {
        (x * powmod((x * x) % m, (e - 1) / 2, m)) % m
    }
}
