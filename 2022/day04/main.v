import common

fn main() {
	lines := common.read_lines(year: 2022, day: 4)
		.filter(it.trim_space().len != 0)

	mut full_overlap := 0
	mut partial_overlap := 0

	for line in lines {
		items := line.split(',')

		p0 := items[0].split('-').map(it.int())
		p1 := items[1].split('-').map(it.int())

		if (p0[0] >= p1[0] && p0[1] <= p1[1]) || (p1[0] >= p0[0] && p1[1] <= p0[1]) {
			full_overlap++
		}

		if (p0[0] <= p1[0] && p0[1] >= p1[0]) || (p1[0] <= p0[0] && p1[1] >= p0[0]) {
			partial_overlap++
		}
	}

	println('Full: ${full_overlap} \nPartial: ${partial_overlap}')
}
