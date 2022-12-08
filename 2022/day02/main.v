import common

const (
	scores = {
		'A': {
			'X': [3 + 1, 3 + 0]
			'Y': [6 + 2, 2 + 2]
			'Z': [3 + 0, 6 + 2]
		}
		'B': {
			'X': [0 + 1, 0 + 1]
			'Y': [3 + 2, 3 + 2]
			'Z': [6 + 3, 6 + 3]
		}
		'C': {
			'X': [6 + 1, 1 + 1]
			'Y': [1 + 1, 3 + 3]
			'Z': [6 + 0, 6 + 1]
		}
	}
)

fn main() {
	mut p0 := 0
	mut p1 := 0

	lines := common.read_lines(year: 2022, day: 2)
		.map(it.trim_space()).filter(it.len != 0)

	for line in lines {
		items := line.split(' ')

		p0 += scores[items[0]][items[1]][0]
		p1 += scores[items[0]][items[1]][1]
	}

	println('P1: ${p0} \nP2: ${p1}')
}
