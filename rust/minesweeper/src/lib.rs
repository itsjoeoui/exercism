use std::collections::HashMap;

pub fn annotate(minefield: &[&str]) -> Vec<String> {
    let mut surrounding: HashMap<(isize, isize), u8> = HashMap::new();

    for (y, row) in minefield.iter().enumerate() {
        for (x, _) in row.chars().enumerate().filter(|(_, cell)| *cell == '*') {
            let (x, y) = (x as isize, y as isize);

            for dx in -1..=1 {
                for dy in -1..=1 {
                    *surrounding.entry((x + dx, y + dy)).or_insert(0) += 1;
                }
            }
        }
    }

    minefield
        .iter()
        .enumerate()
        .map(|(y, row)| {
            row.chars()
                .enumerate()
                .map(|(x, cell)| match cell {
                    '*' => '*',
                    _ => match surrounding.get(&(x as isize, y as isize)) {
                        None | Some(&0) => ' ',
                        Some(&n) => (b'0' + n) as char,
                    },
                })
                .collect()
        })
        .collect()
}
