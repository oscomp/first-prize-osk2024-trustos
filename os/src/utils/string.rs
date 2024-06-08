pub fn trim_first_point_slash(path: &str) -> &str {
    if path.starts_with("./") {
        &path[2..]
    } else {
        &path
    }
}
