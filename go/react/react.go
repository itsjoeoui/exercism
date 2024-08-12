package react

type canceler struct {
	// this cell holds the callback
	computeCell *computeCell
	// the id of the callback to be removed
	callbackId int
}

type inputCell struct {
	// each cell has a unique id
	id int
	// the value of the cell
	value int

	// reactor.deps[id] holds the list of cells that depend on this cell
	reactor *reactor
}

type computeCell struct {
	// each cell has a unique id
	id int
	// assign this id to the next callback created and increment it
	callbackId int
	// functions to be called when the value changes
	callbacks map[int]func(int)
	// compute the value of the cell
	eval func() int
}

type reactor struct {
	// assign this id to the next cell created and increment it
	id int
	// KV pairs of cell id and functions to be called when the value changes
	deps map[int][]func()
}

func (c *canceler) Cancel() {
	delete(c.computeCell.callbacks, c.callbackId)
}

func (c *inputCell) Value() int {
	return c.value
}

func (c *inputCell) SetValue(value int) {
	if c.value == value {
		return
	}

	c.value = value
	for _, callback := range c.reactor.deps[c.id] {
		callback()
	}
}

func (c *computeCell) Value() int {
	return c.eval()
}

func (c *computeCell) AddCallback(callback func(int)) Canceler {
	c.callbackId++

	c.callbacks[c.callbackId] = callback

	canceler := &canceler{
		computeCell: c,
		callbackId:  c.callbackId,
	}

	return canceler
}

func New() Reactor {
	return &reactor{
		id:   0,
		deps: make(map[int][]func()),
	}
}

func (r *reactor) CreateInput(initial int) InputCell {
	r.id++

	inputCell := &inputCell{
		id:      r.id,
		value:   initial,
		reactor: r,
	}

	r.deps[r.id] = make([]func(), 0)

	return inputCell
}

func (r *reactor) CreateCompute1(dep Cell, compute func(int) int) ComputeCell {
	r.id++

	computeCell := &computeCell{
		id:         r.id,
		callbackId: 0,
		callbacks:  make(map[int]func(int)),
		eval: func() int {
			return compute(dep.Value())
		},
	}

	depId := getCellId(dep)

	oldVal := compute(dep.Value())

	updateFunc := func() {
		newVal := compute(dep.Value())
		if oldVal == newVal {
			return
		}

		for _, callback := range computeCell.callbacks {
			callback(newVal)
		}

		for _, fn := range r.deps[computeCell.id] {
			fn()
		}

		oldVal = newVal
	}

	r.deps[depId] = append(r.deps[depId], updateFunc)

	return computeCell
}

func getCellId(cell Cell) int {
	switch cell := cell.(type) {
	case *inputCell:
		return cell.id
	case *computeCell:
		return cell.id
	default:
		return -1
	}
}

func (r *reactor) CreateCompute2(dep1, dep2 Cell, compute func(int, int) int) ComputeCell {
	r.id++

	computeCell := &computeCell{
		id:         r.id,
		callbackId: 0,
		callbacks:  make(map[int]func(int)),
		eval: func() int {
			return compute(dep1.Value(), dep2.Value())
		},
	}

	dep1Id := getCellId(dep1)
	dep2Id := getCellId(dep2)

	oldVal := compute(dep1.Value(), dep2.Value())

	updateFunc := func() {
		newVal := compute(dep1.Value(), dep2.Value())
		if oldVal == newVal {
			return
		}

		for _, callback := range computeCell.callbacks {
			callback(newVal)
		}

		for _, fn := range r.deps[computeCell.id] {
			fn()
		}

		oldVal = newVal
	}

	r.deps[dep1Id] = append(r.deps[dep1Id], updateFunc)
	r.deps[dep2Id] = append(r.deps[dep2Id], updateFunc)

	return computeCell
}
