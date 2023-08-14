package db

import (
	"context"
	"testing"

	"github.com/stretchr/testify/require"
	_ "github.com/stretchr/testify/require"
)

func TestCreateAccount(t *testing.T) {
	arg := CreateAccountParams{
		Owner:    "anurag",
		Balance:  100000000000,
		Currency: "USD",
	}

	account, err := testQueries.CreateAccount(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, account)

}
