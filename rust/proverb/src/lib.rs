use std::iter::once;

pub fn build_proverb(list: &[&str]) -> String {
    match list.len() {
        0 => String::new(),
        _ => (1..list.len())
            .map(|i| format!("For want of a {} the {} was lost.", list[i - 1], list[i]))
            .chain(once(format!("And all for the want of a {}.", list[0])))
            .collect::<Vec<String>>()
            .join("\n"),
    }
}
