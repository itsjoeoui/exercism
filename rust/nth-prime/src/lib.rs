pub fn nth(n: u32) -> u32 {
    let mut primes = vec![2];

    (1..=n).for_each(|_| primes.push(next_prime(&primes)));

    *primes.last().unwrap()
}

fn next_prime(primes: &[u32]) -> u32 {
    let mut cur = primes.last().unwrap() + 1;

    loop {
        if primes.iter().all(|&prime| cur % prime != 0) {
            return cur;
        }

        cur += 1;
    }
}
