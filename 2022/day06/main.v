import common

fn check_for_duplicates(data string) bool {
	mut used := map[u8]bool{}

	for d in data {
		if d in used {
			return true
		}

		used[d] = true
	}

	return false
}

fn main() {
	data := common.read_input(year: 2022, day: 6)

	// P1
	for count in 4 .. data.len {
		if !check_for_duplicates(data[count - 4..count]) {
			println('Part 1: ${count}')
			break
		}
	}

	// P2
	for count in 14 .. data.len {
		if !check_for_duplicates(data[count - 14..count]) {
			println('Part 2: ${count}')
			break
		}
	}
}
