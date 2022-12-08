import common

fn main() {
	lines := common.read_lines(year: 2022, day: 3)
		.map(it.trim_space())

	mut sum := 0
	mut badge_sum := 0
	mut badge_count := 0
	mut badge_history := [3]string{}

	for line in lines {
		badge_history[badge_count] = line
		badge_count++

		left, right := line[..line.len / 2].bytes(), line[line.len / 2..].bytes()

		for i := 0; i < left.len; i++ {
			if right.contains(left[i]) {
				sum += match left[i] {
					0x41...0x5A { left[i] - 38 }
					0x61...0x7A { left[i] - 96 }
					else { 0 }
				}
				break
			}
		}

		if badge_count > 2 {
			badge_count = 0

			b0 := badge_history[0].bytes()
			b1 := badge_history[1].bytes()
			b2 := badge_history[2].bytes()

			for i := 0; i < b0.len; i++ {
				if b1.contains(b0[i]) {
					if b2.contains(b0[i]) {
						badge_sum += match b0[i] {
							0x41...0x5A { b0[i] - 38 }
							0x61...0x7A { b0[i] - 96 }
							else { 0 }
						}
						break
					}
				}
			}
		}
	}

	println('Sum: ${sum} \nBadge: ${badge_sum}')
}
