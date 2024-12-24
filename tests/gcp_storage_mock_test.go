package test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/golang/mock/gomock"
	"github.com/stretchr/testify/assert"
	"cloud.google.com/go/storage"
	"github.com/marcusricardoaguiar/terraform-terratest/tests/mocks/mock_storage" // Path to your mock
)

func TestGCPStorageBucket(t *testing.T) {
	// Start a Go mock controller
	ctrl := gomock.NewController(t)
	defer ctrl.Finish()

	// Create a mock storage client
	mockStorageClient := mock_storage.NewMockStorageClient(ctrl)

	// Define the mock behavior
	mockStorageClient.EXPECT().Bucket("example-bucket-1234").Return(&storage.BucketHandle{}).Times(1)

	// Setup Terraform options
	options := &terraform.Options{
		// The path to the Terraform code
		TerraformDir: "../terraform",

		// Variables to pass to our Terraform code using -var options
		Variables: map[string]interface{}{
			"project_id": "your-project-id",
		},

		// Variables to pass to our Terraform code using environment variables
		EnvVars: map[string]string{
			"GOOGLE_APPLICATION_CREDENTIALS": "path/to/credentials.json",
		},

		// Disable colors in Terraform commands so its easier to read the logs
		NoColor: true,
	}

	// Initialize and apply Terraform code
	defer terraform.Destroy(t, options)
	terraform.InitAndApply(t, options)

	// Get the output values
	bucketName := terraform.Output(t, options, "example_bucket_name")

	// Assert that the bucket was created
	assert.Equal(t, "example-bucket-1234", bucketName)

	// Assert mock was called
	mockStorageClient.EXPECT().Bucket(bucketName).Return(&storage.BucketHandle{})
}
