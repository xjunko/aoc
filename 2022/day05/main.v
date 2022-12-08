import common

fn main() {
	parts := common.read_input(year: 2022, day: 5).split('\n\n')

	crates, instructions := parts[0].split('\n'), parts[1].split('\n').filter(it.len != 0)

	//
	n_stacks := crates[crates.len - 1].split(' ')
		.map(it.trim_space())
		.filter(it.len != 0)
		.map(it.int())
		.last() - 1

	println('P1 Crates: ' + process_instructions(n_stacks, crates, instructions, false))
	println('P2 Crates: ' + process_instructions(n_stacks, crates, instructions, true))
}

fn process_instructions(n_crates int, crates []string, instructions []string, p2 bool) string {
	mut stacks := map[int][]string{}

	for _, crate in crates[..crates.len - 1] {
		// Read by x-axis
		for i := 0; i < crate.len; i += 4 {
			if crate[i] == `[` {
				stacks[i / 4] << crate[i + 1].str_escaped()
			}
		}
	}

	// Process the instructions
	for _, instruction in instructions {
		items := instruction.split(' ')
			.map(it.trim_space())
			.filter(it.len != 0)
			.map(it.int())
			.filter(it > 0)

		amount_to_move := items[0]
		src_stack := items[1] - 1
		dst_stack := items[2] - 1

		// println('=====')
		// println(instruction)
		// println("move ${amount_to_move} from ${src_stack} to ${dst_stack}")
		// print(stacks)

		for _ in 1 .. amount_to_move + 1 {
			if p2 {
				stacks[dst_stack].prepend(stacks[src_stack][..amount_to_move])
				stacks[src_stack] = stacks[src_stack][amount_to_move..]
				break
			} else {
				stacks[dst_stack].prepend(stacks[src_stack][0])
				stacks[src_stack] = stacks[src_stack][1..]
			}
		}

		// print(" == > ")
		// print(stacks)
		// println("")
	}

	mut res := ''

	for i in 0 .. n_crates + 1 {
		if stacks[i].len >= 1 {
			res += stacks[i][0]
		}
	}

	return res
}
