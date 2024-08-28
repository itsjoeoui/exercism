pub fn reply(message: &str) -> &str {
    let msg = message.trim_end();

    if msg.is_empty() {
        return "Fine. Be that way!";
    }

    match (
        msg.ends_with('?'),
        msg.chars().any(char::is_alphabetic) && !msg.chars().any(char::is_lowercase),
    ) {
        (true, true) => "Calm down, I know what I'm doing!",
        (true, _) => "Sure.",
        (_, true) => "Whoa, chill out!",
        _ => "Whatever.",
    }
}
