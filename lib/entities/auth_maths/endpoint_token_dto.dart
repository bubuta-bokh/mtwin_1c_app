class EndpointTokenDto {
  final String? prodEndpoint;
  final String? devEndpoint;
  final String? debugEndpoint;
  final String? accessToken;
  final int? expiresIn;

  EndpointTokenDto(
      {this.prodEndpoint,
      this.devEndpoint,
      this.debugEndpoint,
      this.accessToken,
      this.expiresIn});
}
