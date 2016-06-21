#!/usr/bin/env bats

load ./test_helper

PKGNAME="erlang"
VERSION="18"

image_name="azukiapp/erlang"
 image_tag=$VERSION
image="${image_name}:${image_tag}"

# FIXME: https://github.com/azukiapp/docker-erlang/issues/3
@test "version is correct" {
  run ${DOCKER} run ${image} erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().'  -noshell
  assert_success
  assert_match "${VERSION}"
}

@test "should erlang packages intalled" {
  run ${DOCKER} run ${image} apk info -v
  assert_success
  assert_match "${PKGNAME}-kernel-${VERSION}"
  assert_match "${PKGNAME}-stdlib-${VERSION}"
  assert_match "${PKGNAME}-compiler-${VERSION}"
  assert_match "${PKGNAME}-kernel-${VERSION}"
  assert_match "${PKGNAME}-stdlib-${VERSION}"
  assert_match "${PKGNAME}-compiler-${VERSION}"
  assert_match "${PKGNAME}-crypto-${VERSION}"
  assert_match "${PKGNAME}-syntax-tools-${VERSION}"
  assert_match "${PKGNAME}-inets-${VERSION}"
  assert_match "${PKGNAME}-ssl-${VERSION}"
  assert_match "${PKGNAME}-public-key-${VERSION}"
  assert_match "${PKGNAME}-asn1-${VERSION}"
  assert_match "${PKGNAME}-sasl-${VERSION}"
  assert_match "${PKGNAME}-erl-interface-${VERSION}"
  assert_match "${PKGNAME}-dev-${VERSION}"
}

@test "cache is empty" {
  run ${DOCKER} run ${image} sh -c "ls -1 /var/cache/apk | wc -l"
  assert_success
  [ "${lines[@]: -1}" = "0" ]
}
