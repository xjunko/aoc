import common

fn part_one(lines []string) {
	mut sum := int(0)

	for line in lines {
		// numbers << line.split('').filter(it.is_digit())
		possible_values := line.split('').filter(it[0].is_digit())
		number_for_this_line := (possible_values[0] or { '' } + possible_values#[-1..][0] or { '' }).int()
		sum += number_for_this_line
	}

	println('[1] Sum: ${sum}')
}

fn part_two(lines []string) {
	mut sum := int(0)

	possible_values := {
		'zero':  0
		'one':   1
		'two':   2
		'three': 3
		'four':  4
		'five':  5
		'six':   6
		'seven': 7
		'eight': 8
		'nine':  9
	}

	for line in lines {
		mut numbers := []string{}

		for i := 0; i < line.len; i++ {
			for possible_word, possible_number in possible_values {
				// Word
				if line#[i..i + possible_word.len] == possible_word {
					numbers << possible_number.str()
				}
			}

			// Number as is
			if line[i].is_digit() {
				numbers << line[i].str_escaped()
			}
		}

		number_for_this_line := (numbers[0] or { '' } + numbers#[-1..][0] or { '' }).int()
		sum += number_for_this_line
	}

	println('[2] Sum: ${sum}')
}

fn main() {
	lines := common.read_lines(year: 2023, day: 1)
		.map(it.trim_space())

	part_one(lines)
	part_two(lines)
}
