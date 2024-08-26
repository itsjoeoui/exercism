pub fn factors(mut n: u64) -> Vec<u64> {
    let mut factors = vec![];

    let mut divisor = 2;

    while n > 1 {
        while n % divisor == 0 {
            factors.push(divisor);
            n /= divisor;
        }
        divisor += 1;
    }

    factors
}
