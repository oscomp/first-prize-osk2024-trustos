use alloc::{string::String, vec, vec::Vec};

pub fn trim_first_point_slash(path: &str) -> &str {
    if path.starts_with("./") {
        &path[2..]
    } else {
        &path
    }
}

pub fn path2abs<'a>(cwdv: &mut Vec<&'a str>, pathv: &Vec<&'a str>) -> String {
    for &path_element in pathv.iter() {
        if path_element == "." {
            continue;
        } else if path_element == ".." {
            cwdv.pop();
        } else {
            cwdv.push(path_element);
        }
    }
    let mut abs_path = String::from("/");
    abs_path.push_str(&cwdv.join("/"));
    abs_path
}

#[inline(always)]
pub fn path2vec(path: &str) -> Vec<&str> {
    path.split('/').filter(|s| !s.is_empty()).collect()
}

#[inline(always)]
pub fn is_abs_path(path: &str) -> bool {
    unsafe { *path.as_ptr() == '/' as u8 }
}
/// 用于路径拆分
pub fn rsplit_once<'a>(s: &'a String, delimiter: &str) -> (&'a str, &'a str) {
    let (mut parent_path, child_name) = s.rsplit_once(delimiter).unwrap();
    if parent_path.is_empty() {
        parent_path = "/";
    }
    (parent_path, child_name)
}
