#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq>(first_list: &[T], second_list: &[T]) -> Comparison {
    match (first_list.len(), second_list.len()) {
        (0, 0) => return Comparison::Equal,
        (0, _) => return Comparison::Sublist,
        (_, 0) => return Comparison::Superlist,
        _ => (),
    }

    let (short_list, long_list) = if first_list.len() > second_list.len() {
        (second_list, first_list)
    } else {
        (first_list, second_list)
    };

    for i in 0..long_list.len() {
        if long_list[i] == short_list[0] {
            let mut j = 0;
            while j < short_list.len() && i + j < long_list.len() {
                if long_list[i + j] != short_list[j] {
                    break;
                }
                j += 1;
            }

            if j == short_list.len() {
                if short_list.len() == long_list.len() {
                    return Comparison::Equal;
                }

                if short_list == first_list {
                    return Comparison::Sublist;
                }

                return Comparison::Superlist;
            }
        }
    }

    Comparison::Unequal
}
