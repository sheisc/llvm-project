// RUN: tco --target=x86_64-unknown-linux-gnu %s | FileCheck %s

// Test of building and passing boxchar.

func.func private @callee(%x : !fir.boxchar<1>)

// CHECK-LABEL: define void @get_name
func.func @get_name() {
  %1 = fir.address_of (@name) : !fir.ref<!fir.char<1,9>>
  %2 = arith.constant 9 : i64
  %3 = fir.convert %1 : (!fir.ref<!fir.char<1,9>>) -> !fir.ref<!fir.char<1,?>>
  %4 = fir.emboxchar %3, %2 : (!fir.ref<!fir.char<1,?>>, i64) -> !fir.boxchar<1>
  // CHECK: call void @callee(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @name, i32 0, i32 0), i64 9)
  fir.call @callee(%4) : (!fir.boxchar<1>) -> ()
  return
}

fir.global @name constant : !fir.char<1,9> {
  %str = fir.string_lit "Your name"(9) : !fir.char<1,9>
  //constant 1
  fir.has_value %str : !fir.char<1,9>
}
