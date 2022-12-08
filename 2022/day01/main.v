import common

fn main() {
	mut numbers := []int{len: 1}

	lines := common.read_lines(year: 2022, day: 1)
		.map(it.trim_space())

	for line in lines {
		if line == '' {
			numbers << 0
		}

		numbers[numbers.len - 1] += line.int()
	}

	numbers.sort(b < a)

	println('Calories: ${numbers[0]}')
	println('Total calories: ${numbers[0] + numbers[1] + numbers[2]}')
}
