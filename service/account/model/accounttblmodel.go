package model

import "github.com/zeromicro/go-zero/core/stores/sqlx"

var _ AccountTblModel = (*customAccountTblModel)(nil)

type (
	// AccountTblModel is an interface to be customized, add more methods here,
	// and implement the added methods in customAccountTblModel.
	AccountTblModel interface {
		accountTblModel
	}

	customAccountTblModel struct {
		*defaultAccountTblModel
	}
)

// NewAccountTblModel returns a model for the database table.
func NewAccountTblModel(conn sqlx.SqlConn) AccountTblModel {
	return &customAccountTblModel{
		defaultAccountTblModel: newAccountTblModel(conn),
	}
}
