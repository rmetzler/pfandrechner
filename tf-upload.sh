curl http://testflightapp.com/api/builds.json \
  -F file=@testflightapp.ipa \
  -F api_token='af0ea839ba37b9cbbbd346b7cc5e55d0_NTI0MzU' \
  -F team_token='80b6c4aabaa3e69f6f71cb6c9d8e10aa_MTA1NTQ' \
  -F notes='This build was uploaded via the upload API' \
  -F notify=True \
  -F distribution_lists='Developers'