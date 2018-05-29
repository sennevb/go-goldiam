// Copyright 2017 The go-ethereum Authors
// This file is part of the go-ethereum library.
//
// The go-ethereum library is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// The go-ethereum library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with the go-ethereum library. If not, see <http://www.gnu.org/licenses/>.

package core

// Constants containing the genesis allocation of built-in genesis blocks.
// Their content is an RLP-encoded list of (address, balance) tuples.
// Use mkalloc.go to create/update them.

const mainnetAllocData = "\xe2\xe1\x941\u077d\x9eLJ\xfd{\xc1y\\\xacby\xac4|\xd8\x1f\x03\x8b\x01R\xd0,~\x14\xafh\x00\x00\x00"
const testnetAllocData = "\xe2\xe1\x94L(\x13\xf0yR\xb98L&\xf0\xbf35\xe6I\xa1\x9d\xbd\x15\x8b\x01R\xd0,~\x14\xafh\x00\x00\x00"
const rinkebyAllocData = "\xe2\xe1\x94q\xdbQ\xbf(M\x9f'\xd5-u,\\\xb3\x1b\u014eD\xe8[\x8b\x1b!\xab\x90\x18\xa8\v\xd4\x00\x00\x00"
const devAllocData = "\xe2\xe1\x94\x02-C7\u007f\u0729\x1b\xf1u\xe2\xc0\xea3\xe1\xc1\xe7\xb8r\xbb\x8b\x1b!\xab\x90\x18\xa8\v\xd4\x00\x00\x00"
