package core

type SharedmobilitychError struct {
	IsSharedmobilitychError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewSharedmobilitychError(code string, msg string, ctx *Context) *SharedmobilitychError {
	return &SharedmobilitychError{
		IsSharedmobilitychError: true,
		Sdk:              "Sharedmobilitych",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *SharedmobilitychError) Error() string {
	return e.Msg
}
