include ../support/standard_macro.mak

# Google Test macros
GTEST_DIR=/opt/COTS/defaults/gtest
INC_DIRS+=-I $(GTEST_DIR) \
          -I $(GTEST_DIR)/include
GTEST_ALL=gtest-all.o
GTEST_MAIN=gtest_main.o

BIN_DIR=../bin
UT_DIR=$(BIN_DIR)/UnitTest

# TESTS
TEST_UTILITY_EXE=$(UT_DIR)/UtilityTest_UT.exe
TEST_UTILITY_OBJS= UtilityTest.o \
                  $(GTEST_ALL) \
                  $(GTEST_MAIN)

SRC_DIR=../src
INC_DIRS+=-I $(SRC_DIR)
LXXFLAGS+=-pthread


# TARGETS
test: $(TEST_UTILITY_EXE)
	

$(GTEST_ALL): $(GTEST_DIR)/src/gtest-all.cc
	@$(ECHO)
	@$(ECHO) "================================================================================"
	@$(CXX) $(CXXFLAGS) $(INC_DIRS) -o $@ $<
	@$(ECHO)
	@$(ECHO) "Will store \"$(abspath $@)\""
	@$(ECHO) "================================================================================"
	@$(ECHO)


$(GTEST_MAIN): $(GTEST_DIR)/src/gtest_main.cc
	@$(ECHO)
	@$(ECHO) "================================================================================"
	@$(CXX) $(CXXFLAGS) $(INC_DIRS) -o $@ $<
	@$(ECHO)
	@$(ECHO) "Will store \"$(abspath $@)\""
	@$(ECHO) "================================================================================"
	@$(ECHO)


$(TEST_UTILITY_EXE): $(TEST_UTILITY_OBJS)
	@$(ECHO)
	@$(ECHO) "================================================================================"
	@$(MKDIR) $(UT_DIR)
	$(CXX) $(LXXFLAGS) $(TEST_UTILITY_OBJS) -o $@
	@$(ECHO)
	@$(ECHO) "Will store \"$(abspath $@)\""
	@$(ECHO) "================================================================================"
	@$(ECHO)


clean:
	@$(RM) $(GTEST_ALL)
	@$(RM) $(GTEST_MAIN)
	@$(RM) $(TEST_UTILITY_EXE)
	@$(RM) $(TEST_UTILITY_OBJS)


include ../support/standard_rules.mak
