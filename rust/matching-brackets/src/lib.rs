pub fn brackets_are_balanced(string: &str) -> bool {
    let mut stack = vec![];

    string.chars().all(|c| match c {
        '(' | '[' | '{' => {
            stack.push(c);
            true
        }
        ')' => stack.pop() == Some('('),
        ']' => stack.pop() == Some('['),
        '}' => stack.pop() == Some('{'),
        _ => true,
    }) && stack.is_empty()
}
