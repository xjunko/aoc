module common

import os

[args; params]
pub struct ReadInputConfig {
pub:
	year int
	day  int
}

pub fn read_input(cfg ReadInputConfig) string {
	path := os.join_path('${@VMODROOT}', cfg.year.str(), 'day${cfg.day:02}', 'input.txt')
	return os.read_file(path) or { '' }
}

pub fn read_lines(cfg ReadInputConfig) []string {
	return read_input(cfg).split('\n')
}
