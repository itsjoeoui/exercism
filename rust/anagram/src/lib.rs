use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let word_lower = word.to_lowercase();
    let word_sorted = get_sorted_word(&word_lower);

    possible_anagrams
        .iter()
        .filter(|candidate| {
            let candidate_lower = candidate.to_lowercase();

            candidate_lower.len() == word_lower.len()
                && candidate_lower != word_lower
                && get_sorted_word(&candidate_lower) == word_sorted
        })
        .copied()
        .collect()
}

fn get_sorted_word(word: &str) -> Vec<char> {
    let mut words = word.chars().collect::<Vec<char>>();
    words.sort_unstable();

    words
}
