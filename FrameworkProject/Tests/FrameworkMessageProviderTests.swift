import Testing
import FrameworkProject

struct FrameworkMessageProviderTests {
    @Test
    func testMessage() {
        #expect(FrameworkMessageProvider().getMessage() == "Hello from Framework")
    }

    @Test
    func testRandomNumber() {
        #expect((0...100).contains(FrameworkMessageProvider().getRandomNumber()))
    }
}
