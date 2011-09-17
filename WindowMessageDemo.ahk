SetBatchlines, -1
MyWindow := new CWindowMessageDemo() ;Create an instance of this window class
MySecondWindow := new CWindowMessageDemo() ;Create a second instance of this window class
return

#include <CGUI>
Class CWindowMessageDemo Extends CGUI
{
	__New()
	{
		;CGUI constructor should be called before doing anything else
		base.__New()
		this.Title := "Window message demo"
		this.Resize := true
		this.MinSize := "400x300"
		this.Add("Text", "txtX", "x10", "X:")
		this.Add("Edit", "editX", "x+10", "")
		this.Add("Text", "txtY", "x10", "Y:")
		this.Add("Edit", "editY", "x+10", "")
		this.CloseOnEscape := true
		this.DestroyOnClose := true
		this.OnMessage(0x200, "MouseMove")
		this.Show("")
		return this
	}
	MouseMove(Msg, wParam, lParam)
	{
		this.editX.text := lParam & 0xFFFF
		this.editY.text := (lParam & 0xFFFF0000) >> 16
		return 0
	}
	editX_Leave()
	{
		tooltip editX leave
	}
}