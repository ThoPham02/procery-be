// Code generated by goctl. DO NOT EDIT.
package types

type LoginReq struct {
	Username string `form:"username"`
	Password string `form:"password"`
}

type LoginRes struct {
	Result Result `json:"result"`
	User   User   `json:"user"`
	Token  Token  `json:"token"`
}

type Result struct {
	Code    int64  `json:"code"`
	Message string `json:"message"`
}

type Token struct {
	AccessToken  string `json:"accessToken"`
	RefreshToken string `json:"refreshToken"`
}

type User struct {
	ID       int64  `json:"id"`
	Username string `json:"username"`
	Role     int64  `json:"role"`
	Name     string `json:"name"`
	Email    string `json:"email"`
	Phone    string `json:"phone"`
	AvataUrl string `json:"avataUrl"`
	Birthday string `json:"birthday"`
}