// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4 <0.9;

contract CaseRepository {
    // Case array
    Case[] cases;

    // State variable used to track the number of 
    // created cases and form a unique Id for each case.
    uint caseCount;
    
    // Case struct holding all required case info
    struct Case {
        uint caseId;
        address caseCreator;
        MgmtPhase phase;
    }
    
    // Declare case creation event to enable UI awareness
    
    event CaseCreated(address caseCreator, uint caseId);
    
    // Create the case for incident report, audit, etc..
    // TODO: Implement timedatestamp.
    
    function createCaseFile() public returns (uint, address, MgmtPhase) {
        
        Case memory caseFile =  Case({caseId:caseCount++, caseCreator:msg.sender, phase:MgmtPhase.Created});
        
        cases.push(caseFile);
        
        emit CaseCreated(caseFile.caseCreator, caseFile.caseId);

        return (caseFile.caseId, caseFile.caseCreator, caseFile.phase);
    }
    
    // Declare event for case assignment to an officer, investigator,
    // employee, etc. The case can be reassigned if necessary; while
    // the transaction logs will show the assignment history.
    // TODO: Implement timedatestamp.
    
    event CaseAssigned(address caseOfficer);
    
    // When an officer, case manager, employee, etc. is
    // assigned to the case, the case id  is mapped to 
    // their ethereum address.
    
    mapping (uint => address) caseOfficer;
    
    function assignCase(uint _caseId, address _officerAddress) public {
        
        caseOfficer[_caseId] = _officerAddress;
    }

    enum MgmtPhase {
        Created,
        InvestigationStarted,
        InvestigationEnded,
        Closed
    }

   // constructor(){}
}
