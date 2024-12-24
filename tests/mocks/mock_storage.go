// mock_storage.go
package mock_storage

import (
	"github.com/golang/mock/gomock"
	"cloud.google.com/go/storage"
	"context"
)

type MockStorageClient struct {
	ctrl     *gomock.Controller
	recorder *MockStorageClientMockRecorder
}

type MockStorageClientMockRecorder struct {
	mock *MockStorageClient
}

func NewMockStorageClient(ctrl *gomock.Controller) *MockStorageClient {
	mock := &MockStorageClient{ctrl: ctrl}
	mock.recorder = &MockStorageClientMockRecorder{mock}
	return mock
}

func (m *MockStorageClient) Bucket(name string) *storage.BucketHandle {
	ret := m.ctrl.Call(m, "Bucket", name)
	ret0, _ := ret[0].(*storage.BucketHandle)
	return ret0
}

func (m *MockStorageClient) EXPECT() *MockStorageClientMockRecorder {
	return m.recorder
}
